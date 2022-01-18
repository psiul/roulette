select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,warehouse w,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 39 and cd.cd_hash <= 439 and d.d_hash >= 231 and d.d_hash <= 981 and hd.hd_hash >= 336 and hd.hd_hash <= 669
;
