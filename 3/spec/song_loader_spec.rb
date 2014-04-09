require 'rspec'

require_relative '../lib/song_loader'

describe SongLoader do
  let(:file_double) { double "file double" }
  before(:each) do
    allow(File).to receive(:open).and_return file_double
  end

  describe "#initialize" do
    before(:each) do
      allow(file_double).to receive(:each_line).and_return nil
    end

    it "should open the file" do
      expect(File).to receive(:open).with('empty_file', 'r').and_return file_double

      expect(SongLoader.new 'empty_file')
    end

    context "empty file" do
      before(:each) do
        allow(File).to receive(:open).with('empty_file', 'r').and_return file_double
      end

      it "should try to read the file" do
        expect(file_double).to receive(:each_line).and_return nil

        expect(SongLoader.new 'empty_file')
      end
    end

    context "not empty file" do
      context "only header in the file" do
        before(:each) do
          allow(file_double).to receive(:each_line).and_return "1 2"
        end

        it "should read the first line" do
          expect(file_double).to receive(:each_line).and_return "0 0"

          expect(SongLoader.new 'only_header')
        end

        it "should set the number of songs" do
          subject = SongLoader.new 'only_header'

          expect(subject.instance_variable_get :songs_number).to eq 1
        end
      end


    end
  end

  describe "#best" do
    it "should return with the expected number of best songs"
  end
end
