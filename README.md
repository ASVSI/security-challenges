# ASVSI Open Security Repository

> Simple, beginner-friendly security challenges for learning, contribution, and community growth.

---

![ASVSI](https://github.com/ASVSI.png)

## 🔥 Quick overview

**ASVSI Open Security Repository** hosts small, self-contained security challenges across Solidity, web-security, cryptography, and zero-knowledge proofs. Each challenge is intentionally scoped for learning - beginners can start, contributors can add solutions, and experts can review and mentor.

Use this repo to: **try challenges, submit PRs, get contributor recognition, and level-up your security skills.**

---

## 📚 Table of contents

1. [Repository structure](#repository-structure)
2. [How challenges work](#how-challenges-work)
3. [Challenge template (use for new PRs)](#challenge-template)
4. [Submitting solutions](#submitting-solutions)
5. [Contribution guidelines](#contribution-guidelines)
6. [Recognition & leaderboard](#recognition--leaderboard)
7. [Code of conduct](#code-of-conduct)
8. [License & attribution](#license--attribution)
9. [Contact & support](#contact--support)

---

## 🗂 Repository structure

```
security-challenges/
├─ .github/
│  ├─ ISSUE_TEMPLATE.md
│  └─ PULL_REQUEST_TEMPLATE.md
├─ challenges/
│  ├─ solidity/
│  │  ├─ challenge-01-signature-bypass/
│  │  │  ├─ README.md
│  │  │  ├─ contract.sol
│  │  │  └─ solutions/
│  │  │     └─ example-solution.md
│  │  └─ challenge-02-reentrancy-foundations/
│  ├─ web-security/
│  └─ zk/
├─ CONTRIBUTING.md
├─ LEADERBOARD.md
├─ README.md    ← (this file)
└─ CODE_OF_CONDUCT.md
```

---

## 🧭 How challenges work

* Each challenge lives in its own folder under `challenges/{category}/challenge-XX-name`.
* The challenge folder MUST include a `README.md` describing the goal, rules, and expected outputs, and the vulnerable code (if applicable).
* Solutions go into the `solutions/` folder inside each challenge. Contributors add one file named: `github-username.md` or `github-username.sol` or `github-username.{ext}`.
* Maintain simplicity - challenges should be solvable with basic tooling and clear guidance.

---

## 📝 Challenge README - required sections

Every challenge `README.md` should include:

* **Title & short description** (1–2 lines)
* **Difficulty** (Beginner / Intermediate / Advanced)
* **Category** (Solidity / Web / Crypto / ZK)
* **Goal / Tasks** (What to do exactly)
* **Files included** (contract.sol, app/, etc.)
* **How to verify / run** (commands or test commands)
* **Rules** (what’s allowed / disallowed - e.g., don’t include malware, no private keys)
* **Submission** (how to add solution to `solutions/`)

---

## ✍️ Challenge template (copy for new challenge PRs)

Create a new folder `challenge-XX-title` and include a `README.md` using the following skeleton:

```md
# Challenge #XX - Short Title

**Category:** Solidity
**Difficulty:** Beginner

## Description
Short, clear description of the vulnerability or task.

## Goal
What the contributor must achieve. Example: "Exploit the contract to drain 1 ETH from Vault.sol"

## Files provided
- contract.sol
- test/ (optional)


## Rules
- No private keys or harmful payloads.
- Keep solutions educational.

## Submission
Add your solution to `/solutions/{your-github-username}.md` or submit a PR with the fix/exploit.
```

---

## 🔁 Submitting solutions (recommended flow)

1. Fork the repo
2. Create a branch: `feat/challenge-01-yourname-solution`
3. Add your solution file under `challenges/.../solutions/your-username.md`
4. Include a short explanation, steps to reproduce, and code/test files
5. Submit a PR referencing the challenge and any related issue
6. Maintainers or peers will review, provide feedback, and merge

**Naming rule for solution files:** `github-username.md` (markdown preferred)

---

## ✅ Contribution guidelines (high-level)

* Keep posts and solutions beginner-friendly when labeled as such.
* Provide working repro steps and tests where possible.
* Do not include any sensitive data (private keys, leaked DBs, real user data).
* Follow the repository’s `PULL_REQUEST_TEMPLATE.md` and `ISSUE_TEMPLATE.md`.
* Respect reviewers' feedback - be responsive and iterate.

Read the full `CONTRIBUTING.md` for details.

---

## 🏆 Recognition & leaderboard

We want contributors to get visible credit:

* Every merged PR that adds a valid solution earns points.
* Points are tracked in `LEADERBOARD.md`.
* Top contributors get ranks and optional `ASVSI` digital badges.

If you want your GitHub profile shown on the website or in our social posts, mention it in your PR.

---

## 🤝 Code of Conduct

Be respectful. No harassment, hate speech, or abusive behaviour. See `CODE_OF_CONDUCT.md` for details. Violations may result in PR rejection and contributor removal.

---

## 📜 License & attribution

This repository is released under the **MIT License**. By contributing, you agree to license your contributions under the repo license.

---

## 📬 Contact & support

* Questions? Open an issue and tag `help-wanted`
* Want to propose new feature sets or a leaderboard integration? Open an issue in `feature-requests`.
* Twitter / X: `@ASVSI`

---

Thanks for contributing - let’s make security learning open and friendly. 🚀

*— ASVSI Team*
