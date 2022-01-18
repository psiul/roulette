select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer_demographics cd,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 137 and ws.ws_hash <= 887 and i.i_hash >= 227 and i.i_hash <= 560 and cd.cd_hash >= 22 and cd.cd_hash <= 422
;
