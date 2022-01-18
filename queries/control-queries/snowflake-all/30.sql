select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,ship_mode sm,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 273 and ws.ws_hash <= 673 and cd.cd_hash >= 15 and cd.cd_hash <= 348 and d.d_hash >= 199 and d.d_hash <= 949
;
