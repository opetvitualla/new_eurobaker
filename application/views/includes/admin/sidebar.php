<aside class="left-sidebar mini-side">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <?php if ($this->session->userdata('user_type') == 1) { ?>
                  <li> <a class="waves-effect waves-dark" href="<?= base_url('manageemployees') ?>" aria-expanded="false"><i class="icon-User "></i><span class="hide-menu">Manage Users</span></a>
                  </li>
                <?php } ?>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('managepurchaseorders') ?>" aria-expanded="false"><i class="icon-Remove-Cart "></i><span class="hide-menu">Purchase Order</span></a>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('managesuppliers/') ?>" aria-expanded="false"><i class="icon-Truck"></i><span class="hide-menu">Supplier</span></a>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="icon-Bag-Items"></i><span class="hide-menu">Raw Materials</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<?= base_url('managerawmaterials/') ?>">List of Raw Materials</a></li>
                        <li><a href="<?= base_url('managerawmaterials/price_log') ?>">Price Logs</a></li>
                        <li><a href="<?= base_url('managerawmaterials/categories') ?>">Categories</a></li>
                        <li><a href="<?= base_url('managerawmaterials/units') ?>">Units</a></li>
                        <!-- <li><a href="<?= base_url('managerawmaterials/unit_conversion') ?>">Item Unit Conversion</a></li> -->
                        <li><a href="<?= base_url('managerawmaterials/expired_items') ?>">Expired Items</a></li>
                    </ul>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('manageiteminventory/') ?>" aria-expanded="false"><i class="icon-Bar-Chart  "></i><span class="hide-menu">Item Inventory </span></a>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="icon-Warehouse "></i><span class="hide-menu">Manage Stocks</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li>
                          <a href="<?= base_url('managestocks/stocktransfer') ?>  ">Stock Transfer
                            <?php if (!empty(_count_stock_transfer())): ?>
                              <span class="label label-rounded label-danger submenu"><?= _count_stock_transfer() ?></span>
                            <?php endif; ?>
                          </a>
                        </li>
                        <li><a href="<?= base_url('stockout') ?>">Stock Out</a></li>
                        <!-- <li><a href="<?= base_url('managestocks/stockadjustments') ?>">Stock Adjustment</a></li> -->
                    </ul>
                </li>
                <li> <a class="waves-effect waves-dark" href="<?= base_url('other_outlet_deliveries/') ?>" aria-expanded="false"><i class="icon-Truck"></i><span class="hide-menu">Other Outlet Deliveries</span></a>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="icon-File-HorizontalText "></i><span class="hide-menu">Reports</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<?= base_url('total_purchase_order') ?>">Total Purchases</a></li>
                        <li><a href="#">Total Used/Stock Out</a></li>
                       <li><a href="<?= base_url('managereports/pendingdeliveries') ?>">Pending Deliveries</a></li>
                        <li><a href="<?= base_url('managereports/endinginventory') ?>">Ending Inventory</a></li>
                        <li><a href="<?= base_url('managereports/stockfortransfer') ?>">Stock Transfer</a></li>
                        <li><a href="#">Descripancies</a></li>
                    </ul>
                </li>

            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
