select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 5 and ss.ss_hash <= 755 and d.d_hash >= 351 and d.d_hash <= 751 and hd.hd_hash >= 461 and hd.hd_hash <= 794
;
