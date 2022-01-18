select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 599 and ss.ss_hash <= 932 and i.i_hash >= 138 and i.i_hash <= 538 and d.d_hash >= 61 and d.d_hash <= 811
;
