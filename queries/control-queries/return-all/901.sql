select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 544 and d.d_hash <= 877 and sm.sm_hash >= 91 and sm.sm_hash <= 841 and i.i_hash >= 562 and i.i_hash <= 962
;
