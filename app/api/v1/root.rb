module V1
  class Root < Grape::API
    version :v1
    format :json

    mount V1::Users
    mount V1::Wines
    add_swagger_documentation(
      doc_version: '1.0.0',
      info: {
        title: 'テストAPI',
        description: 'APIドキュメントです',
      }
    )
  end
end
