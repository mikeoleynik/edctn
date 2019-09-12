shared_examples 'success data' do
  it 'return data in the response' do
    expect(json_response).to have_key('data')
  end
end