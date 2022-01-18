select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,warehouse w,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 524 and ws.ws_hash <= 924 and d.d_hash >= 159 and d.d_hash <= 909 and i.i_hash >= 172 and i.i_hash <= 505
;
