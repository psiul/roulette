select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer_demographics cd,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and hd.hd_hash >= 232 and hd.hd_hash <= 632 and d.d_hash >= 237 and d.d_hash <= 570 and cd.cd_hash >= 4 and cd.cd_hash <= 754
;
