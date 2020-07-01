<aside class="left-sidebar mini-side">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li> <a class="waves-effect waves-dark" href="<?= base_url('ManageOutlets') ?>" aria-expanded="false"><i class="icon-Home"></i><span class="hide-menu">Outlets</span></a>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('ManagePurchaseOrders') ?>" aria-expanded="false"><i class="icon-Remove-Cart "></i><span class="hide-menu">Purchase Order</span></a>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('ManageSuppliers') ?>" aria-expanded="false"><i class="icon-Truck"></i><span class="hide-menu">Supplier</span></a>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('ManageItemInventory') ?>" aria-expanded="false"><i class="icon-Bar-Chart  "></i><span class="hide-menu">Item Inventory</span></a>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="icon-Warehouse "></i><span class="hide-menu">Manage Stocks</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<?= base_url('Managestocks/StockAdjustments') ?>">Stock Adjustment</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
