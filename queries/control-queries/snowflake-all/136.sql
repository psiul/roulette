select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,ship_mode sm,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 44 and ws.ws_hash <= 444 and d.d_hash >= 230 and d.d_hash <= 980 and i.i_hash >= 59 and i.i_hash <= 392
;
