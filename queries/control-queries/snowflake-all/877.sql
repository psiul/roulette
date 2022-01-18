select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,item i,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 6 and ws.ws_hash <= 406 and cd.cd_hash >= 84 and cd.cd_hash <= 834 and i.i_hash >= 48 and i.i_hash <= 381
;
