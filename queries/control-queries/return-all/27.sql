select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 225 and ss.ss_hash <= 975 and hd.hd_hash >= 115 and hd.hd_hash <= 515 and i.i_hash >= 508 and i.i_hash <= 841
;
