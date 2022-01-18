select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 96 and ss.ss_hash <= 496 and hd.hd_hash >= 49 and hd.hd_hash <= 799 and i.i_hash >= 441 and i.i_hash <= 774
;
