select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer_demographics cd,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 385 and ws.ws_hash <= 785 and i.i_hash >= 5 and i.i_hash <= 338 and cd.cd_hash >= 30 and cd.cd_hash <= 780
;
