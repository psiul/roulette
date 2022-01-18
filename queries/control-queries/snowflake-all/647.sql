select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 83 and ws.ws_hash <= 833 and cd.cd_hash >= 153 and cd.cd_hash <= 553 and hd.hd_hash >= 280 and hd.hd_hash <= 613
;
