select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 178 and ss.ss_hash <= 678 and i.i_hash >= 251 and i.i_hash <= 451
;
