select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 290 and ss.ss_hash <= 690 and i.i_hash >= 67 and i.i_hash <= 817 and d.d_hash >= 288 and d.d_hash <= 621
;
