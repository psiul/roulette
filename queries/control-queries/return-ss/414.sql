select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 125 and ss.ss_hash <= 458 and hd.hd_hash >= 433 and hd.hd_hash <= 833 and i.i_hash >= 81 and i.i_hash <= 831
;
