select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,date_dim d,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 221 and ws.ws_hash <= 554 and cd.cd_hash >= 565 and cd.cd_hash <= 965 and i.i_hash >= 144 and i.i_hash <= 894
;
