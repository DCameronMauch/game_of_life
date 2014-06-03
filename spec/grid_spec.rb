require_relative '../grid'

describe Grid do
  let(:width) { 80 }
  let(:height) { 80 }
  let(:density) { 0.25 }

  subject { described_class.new width, height, density }

  describe '::new' do
    it 'populates and finds neighbors' do
      expect(subject).to receive(:populate).and_return(nil)
      expect(subject).to receive(:find_neighbors).and_return(nil)

      subject
    end
  end

  describe '#step' do
    it 'observes and evolves all cells' do
      expect(subject).to receive(:cells_observe).and_return(nil)
      expect(subject).to receive(:cells_evolve).and_return(nil)

      subject.step
    end
  end
end
