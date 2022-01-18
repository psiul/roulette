select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,date_dim d,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 335 and ws.ws_hash <= 735 and hd.hd_hash >= 654 and hd.hd_hash <= 987 and i.i_hash >= 95 and i.i_hash <= 845
;
