select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,household_demographics hd,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 527 and ws.ws_hash <= 927 and cd.cd_hash >= 247 and cd.cd_hash <= 997 and d.d_hash >= 2 and d.d_hash <= 335
;
