require 'spec_helper'
module Exlibris
  module Aleph
    describe Collection do
      let(:code) { 'MAIN' }
      let(:display) { 'Main Collection' }
      let(:admin_library) { AdminLibrary.new('ADM50') }
      let(:sub_library) { SubLibrary.new('SUB', 'Sub Library', admin_library) }
      subject(:collection) { Collection.new(code, display, sub_library) }
      it { should be_a Collection }
      describe '#code' do
        subject { collection.code }
        it { should eq code }
      end
      describe '#display' do
        subject { collection.display }
        it { should eq display }
      end
      describe '#sub_library' do
        subject { collection.sub_library }
        it { should be_a SubLibrary }
        it { should eq sub_library }
      end
      context 'when initialized without a "sub_library" argument' do
        subject { Collection.new(code, display) }
        it 'should raise an ArgumentError' do
          expect { subject }.to raise_error ArgumentError
        end
      end
      context 'when initialized with a "sub_library" argument' do
        context 'but the "sub_library" argument is not an SubLibrary' do
          let(:sub_library) { "invalid" }
          it 'should raise an ArgumentError' do
            expect { subject }.to raise_error ArgumentError
          end
        end
      end
    end
  end
end
