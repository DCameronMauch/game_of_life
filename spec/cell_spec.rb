require_relative '../cell'

describe Cell do
  let(:alive_cell) { double 'cell', alive: true }
  let(:dead_cell) { double 'cell', alive: false }

  subject { described_class.new alive }

  before(:each) do
    subject.neighbors = neighbors
    subject.observe
    subject.evolve
  end

  context 'starts alive' do
    let(:alive) { true }

    (0..1).each do |ac|
      dc = 8 - ac

      context 'less than 2 alive neighbors' do
        let(:neighbors) { [alive_cell]*ac + [dead_cell]*dc }

        it 'dies' do
          expect(subject.alive).to eq(false)
        end
      end
    end

    (2..3).each do |ac|
      dc = 8 - ac

      context '2 or 3 alive neighbors' do
        let(:neighbors) { [alive_cell]*ac + [dead_cell]*dc }

        it 'stays alive' do
          expect(subject.alive).to eq(true)
        end
      end
    end

    (4..8).each do |ac|
      dc = 8 - ac

      context 'more than 3 alive neighbors' do
        let(:neighbors) { [alive_cell]*ac + [dead_cell]*dc }

        it 'dies' do
          expect(subject.alive).to eq(false)
        end
      end
    end
  end

  context 'starts dead' do
    let(:alive) { false }

    (0..2).each do |ac|
      dc = 8 - ac

      context 'less than 3 alive neighbors' do
        let(:neighbors) { [alive_cell]*ac + [dead_cell]*dc }

        it 'stays dead' do
          expect(subject.alive).to eq(false)
        end
      end
    end

    context '3 alive neighbors' do
      let(:neighbors) { [alive_cell]*3 + [dead_cell]*5 }

      it 'comes alive' do
        expect(subject.alive).to eq(true)
      end
    end

    (4..8).each do |ac|
      dc = 8 - ac

      context 'more than 3 alive neighbors' do
        let(:neighbors) { [alive_cell]*ac + [dead_cell]*dc }

        it 'stays dead' do
          expect(subject.alive).to eq(false)
        end
      end
    end
  end
end
