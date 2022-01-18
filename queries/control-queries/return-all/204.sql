select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,web_returns wr,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 113 and ws.ws_hash <= 863 and hd.hd_hash >= 475 and hd.hd_hash <= 808 and cd.cd_hash >= 172 and cd.cd_hash <= 572
;
