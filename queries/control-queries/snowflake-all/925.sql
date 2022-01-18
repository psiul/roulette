select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer_demographics cd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 450 and ws.ws_hash <= 850 and hd.hd_hash >= 106 and hd.hd_hash <= 439 and i.i_hash >= 21 and i.i_hash <= 771
;
