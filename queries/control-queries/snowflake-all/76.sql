select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer_demographics cd,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 257 and ws.ws_hash <= 657 and d.d_hash >= 543 and d.d_hash <= 876 and cd.cd_hash >= 135 and cd.cd_hash <= 885
;
