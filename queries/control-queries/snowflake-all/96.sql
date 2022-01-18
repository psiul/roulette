select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,date_dim d,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 0 and ws.ws_hash <= 750 and hd.hd_hash >= 174 and hd.hd_hash <= 574 and cd.cd_hash >= 274 and cd.cd_hash <= 607
;
