select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 201 and ss.ss_hash <= 951 and i.i_hash >= 201 and i.i_hash <= 601 and d.d_hash >= 604 and d.d_hash <= 937
;
