select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 435 and ss.ss_hash <= 835 and i.i_hash >= 32 and i.i_hash <= 365 and hd.hd_hash >= 111 and hd.hd_hash <= 861
;
