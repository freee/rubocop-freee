# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Freee::ScopeReturnValue do
  subject(:cop) { described_class.new }

  let(:good_source) do
    <<-SOURCE
      class Test < ActiveRecord::Base
        scope :mine1, ->(id) { where(id: id) }
        scope :mine2, -> do
          where(id: self.company.id)
        end
        def self.a(arg1, arg2)
          arg1 * arg2 + self.id
        end
        def b(arg1, arg2)
          arg1 * arg2
        end
      end
    SOURCE
  end

  let(:bad_source) do
    <<-SOURCE
      class Test < ActiveRecord::Base
        scope :mine1, -> { nil;self }
        scope :mine2, ->(id) do
          if id.nil?
            self
          else
            where(id: id)
          end
        end
        def self.a(arg1, arg2)
          arg1 * arg2 + self.id
        end
        def b(arg1, arg2)
          arg1 * arg2
        end
      end
    SOURCE
  end

  context 'when good' do
    it do
      inspect_source(good_source, cop)
      expect(cop.offenses).to be_empty
    end
  end

  context 'when bad' do
    it do
      inspect_source(bad_source, cop)
      expect(cop.offenses.size).to eq(2)
      expect(cop.message).to eq('scopeでselfを返してはいけません...')
    end
  end
end
