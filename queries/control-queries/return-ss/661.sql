select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 370 and ss.ss_hash <= 770 and hd.hd_hash >= 653 and hd.hd_hash <= 986 and i.i_hash >= 241 and i.i_hash <= 991
;
