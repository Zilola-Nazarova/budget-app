class PurchasesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @purchases = @group.purchases.order(id: :desc)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @groups = current_user.groups
    puts "HERE #{@groups}"
    @purchase = Purchase.new
    @purchase.group_purchases.build
    # index = 0
    # @groups.count.times do
    #   @purchase.group_purchases.new
    #   index += 1
    #   name = @group.name
    # end
    # @purchase.group_purchases.build
    # @group_purchase = GroupPurchase.new
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    # puts "HERE #{purchase_params[:group_purchases_attributes]['0'][:group_id].first}"
    # puts "HERE #{purchase_params[:group_id]}"
    @purchase.save!

    # purchase_params[:group_purchases_attributes]['0'][:group_id].each do |id|
    #   @purchase.group_purchases.new
    #   group_purchase = GroupPurchase.new(group_id: id, purchase_id: @purchase.id)
    #   group_purchase.save!
    # end
    redirect_to group_purchases_path(params[:group_id])
  end

  def edit; end

  def update; end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy!
    flash[:success] = 'Transaction was deleted successfully!'
    redirect_to group_purchases_url(params[:group_id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, group_purchases_attributes: :group_id)
  end
end
