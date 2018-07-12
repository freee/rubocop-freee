# frozen_string_literal: true

module RuboCop
  module Cop
    module Freee
      # scope内でselfを返していないかチェックするcop.
      # selfを返すとwhere句がすべて外れ、全ユーザーのデータが
      # 見えてしまう恐れがある.
      #
      # autocorrectは実装しない.
      #
      class ScopeReturnValue < Cop
        MSG = 'scopeでselfを返してはいけません...'

        def_node_matcher :scope_call, <<-SCOPE
          (send nil :scope $...)
        SCOPE

        def on_send(node)
          return unless scope_node?(node)

          scope_call(node) do |args|
            n = args.find(&:lambda_or_proc?)
            return unless n

            add_offense(node, :expression, MSG) unless check_scope_node(n)
          end
        end

        private

        def scope_node?(node)
          node.send_type? && node.method_name == :scope
        end

        def self_of_end?(node)
          node.self_type? && node.descendants.size.zero?
        end

        def caller_node?(node)
          node.parent.send_type?
        end

        # 末端のNodeかつtypeがselfなものがあればアウト
        def check_scope_node(node)
          res = true
          node.each_descendant do |n|
            res = false if self_of_end?(n) && !caller_node?(n)
          end
          res
        end
      end
    end
  end
end
