select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,customer_demographics cd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 477 and ws.ws_hash <= 877 and i.i_hash >= 144 and i.i_hash <= 894 and cd.cd_hash >= 68 and cd.cd_hash <= 401
;
