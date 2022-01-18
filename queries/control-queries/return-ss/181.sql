select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 529 and ss.ss_hash <= 862 and d.d_hash >= 477 and d.d_hash <= 877 and hd.hd_hash >= 92 and hd.hd_hash <= 842
;
