select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer_demographics cd,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 165 and ws.ws_hash <= 565 and d.d_hash >= 49 and d.d_hash <= 382 and cd.cd_hash >= 45 and cd.cd_hash <= 795
;
