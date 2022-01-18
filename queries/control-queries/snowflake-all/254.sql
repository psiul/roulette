select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,ship_mode sm,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 267 and ws.ws_hash <= 667 and sm.sm_hash >= 174 and sm.sm_hash <= 924 and cd.cd_hash >= 348 and cd.cd_hash <= 681
;
