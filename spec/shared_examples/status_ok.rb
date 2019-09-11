shared_examples 'status 200' do
  it 'return status 200' do
    expect(response.status).to eq 200
  end
end