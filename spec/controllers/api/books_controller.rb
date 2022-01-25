require 'rails_helper'

describe Api::BooksController do
  describe 'GET #index' do
    context 'When fetching all books' do
      let!(:books) { create_list(:book, 2) }

      it 'responds with 401 status' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end

      context 'when the user is authenticated' do
        include_context 'Authenticated User'
        before(:each) { get :index }

        it 'responds with 200 status' do
          expect(response).to have_http_status(:ok)
        end

        it 'responses with the books json' do
          expected = ActiveModel::Serializer::CollectionSerializer.new(
            books, each_serializer: BookSerializer
          ).to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      it 'responds with 401 status' do
        get :show, params: { id: book.id }
        expect(response).to have_http_status(:unauthorized)
      end

      context 'when the user is authenticated' do
        include_context 'Authenticated User'
        before { get :show, params: { id: book.id } }

        it 'responds with 200 status' do
          expect(response).to have_http_status(:ok)
        end

        it 'responses with the book json' do
          expected = BookSerializer.new(book, root: false).to_json
          expect(response.body.to_json) =~ JSON.parse(expected)
        end
      end
    end
  end
end
