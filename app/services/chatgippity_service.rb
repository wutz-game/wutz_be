class ChatgippityService
  attr_reader :category_name

  def initialize(category)
    @category = category
  end

  def get_url
    response = conn.post('chat/completions') do |req|
      req.body = JSON.dump(request_body)
    end
    
    if response.success?
      JSON.parse(response.body)['choices'][0]['message']['content']
    else  # These two lines could be refactored to handle errors better
      raise 'Failed to generate a response from ChatGPT API'
    end
  end

  private

  def conn
    api_key = Rails.application.credentials.api_key

    @conn ||= Faraday.new('https://api.openai.com/v1/', ssl: { verify: true }) do |builder|
      builder.request :url_encoded
      builder.headers['Content-Type'] = 'application/json'
      builder.headers['Authorization'] = api_key
      builder.adapter Faraday.default_adapter
    end

  end

  def request_body
    {
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'system',
          content: 'You are a helpful assistant.'
        },
        {
          role: 'user',
          content: "Hello, I need one emoji to represent: 'geography'"
        },
        {
          role: 'assistant',
          content: '🌎'
        },
        {
          role: 'user',
          content: "Perfect! Can I have one emoji to represent: '#{@category}'"
        }
      ],
      temperature: 0.1,
      max_tokens: 60,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0
    }
  end
end
