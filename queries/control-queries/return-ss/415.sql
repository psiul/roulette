select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 350 and ss.ss_hash <= 750 and hd.hd_hash >= 342 and hd.hd_hash <= 675 and cd.cd_hash >= 56 and cd.cd_hash <= 806
;
