select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and hd.hd_hash >= 124 and hd.hd_hash <= 874 and d.d_hash >= 105 and d.d_hash <= 438 and i.i_hash >= 67 and i.i_hash <= 467
;
