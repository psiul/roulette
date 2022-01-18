select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,item i,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 3 and ws.ws_hash <= 753 and cd.cd_hash >= 92 and cd.cd_hash <= 492 and i.i_hash >= 134 and i.i_hash <= 467
;
