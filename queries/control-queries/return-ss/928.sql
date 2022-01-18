select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 244 and ss.ss_hash <= 994 and d.d_hash >= 576 and d.d_hash <= 909 and i.i_hash >= 122 and i.i_hash <= 522
;
