select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer_demographics cd,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 462 and ws.ws_hash <= 862 and d.d_hash >= 528 and d.d_hash <= 861 and cd.cd_hash >= 158 and cd.cd_hash <= 908
;
