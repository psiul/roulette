select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 481 and ss.ss_hash <= 881 and d.d_hash >= 62 and d.d_hash <= 395 and hd.hd_hash >= 54 and hd.hd_hash <= 804
;
