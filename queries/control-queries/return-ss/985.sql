select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 308 and ss.ss_hash <= 708 and i.i_hash >= 94 and i.i_hash <= 844 and hd.hd_hash >= 548 and hd.hd_hash <= 881
;
