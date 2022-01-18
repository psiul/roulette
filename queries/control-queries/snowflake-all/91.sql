select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,item i,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 166 and ws.ws_hash <= 566 and hd.hd_hash >= 481 and hd.hd_hash <= 814 and i.i_hash >= 216 and i.i_hash <= 966
;
