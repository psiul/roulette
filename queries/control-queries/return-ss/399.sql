select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 38 and ss.ss_hash <= 438 and i.i_hash >= 508 and i.i_hash <= 841 and d.d_hash >= 179 and d.d_hash <= 929
;
