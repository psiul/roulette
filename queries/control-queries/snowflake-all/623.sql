select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,date_dim d,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 210 and ws.ws_hash <= 960 and i.i_hash >= 525 and i.i_hash <= 925 and cd.cd_hash >= 501 and cd.cd_hash <= 834
;
